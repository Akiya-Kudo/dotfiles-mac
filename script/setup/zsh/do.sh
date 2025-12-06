#!/bin/bash
# zshの設定を行う
# .zshrcを~/.config/zsh/.zshrcに配置したいのでその設定を~/.zshenvと設定してそこから.zshrcの設定pathを設定するための.zshenvのaliasの実行をこれが行う

set -e

# スクリプトのディレクトリからdotfilesのルートパスを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# .config/zshディレクトリを作成
mkdir -p "$HOME/.config/zsh"

# .zshrcを~/.config/zsh/.zshrcにシンボリックリンク
if [ -f "$DOTFILES_ROOT/.config/zsh/.zshrc" ]; then
    if [ -L "$HOME/.config/zsh/.zshrc" ] || [ -f "$HOME/.config/zsh/.zshrc" ]; then
        echo "既存の ~/.config/zsh/.zshrc をバックアップします"
        mv "$HOME/.config/zsh/.zshrc" "$HOME/.config/zsh/.zshrc.bak.$(date +%Y%m%d_%H%M%S)"
    fi
    ln -snfv "$DOTFILES_ROOT/.config/zsh/.zshrc" "$HOME/.config/zsh/.zshrc"
    echo "✓ .zshrcを ~/.config/zsh/.zshrc にリンクしました"
else
    echo "エラー: $DOTFILES_ROOT/.config/zsh/.zshrc が見つかりません"
    exit 1
fi

# .zshenvを作成または更新
ZSENV_FILE="$HOME/.zshenv"
ZDOTDIR_LINE="export ZDOTDIR=\"\$HOME/.config/zsh\""

if [ -f "$ZSENV_FILE" ]; then
    # 既存の.zshenvにZDOTDIRの設定があるか確認
    if grep -q "^export ZDOTDIR=" "$ZSENV_FILE"; then
        # 既存のZDOTDIR設定を更新
        if [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS用
            sed -i '' "s|^export ZDOTDIR=.*|$ZDOTDIR_LINE|" "$ZSENV_FILE"
        else
            # Linux用
            sed -i "s|^export ZDOTDIR=.*|$ZDOTDIR_LINE|" "$ZSENV_FILE"
        fi
        echo "✓ ~/.zshenv の ZDOTDIR 設定を更新しました"
    else
        # ZDOTDIR設定を追加
        echo "" >> "$ZSENV_FILE"
        echo "# zsh設定ファイルのパスを設定" >> "$ZSENV_FILE"
        echo "$ZDOTDIR_LINE" >> "$ZSENV_FILE"
        echo "✓ ~/.zshenv に ZDOTDIR 設定を追加しました"
    fi
else
    # 新規作成
    cat > "$ZSENV_FILE" <<EOF
# zsh設定ファイルのパスを設定
$ZDOTDIR_LINE
EOF
    echo "✓ ~/.zshenv を作成しました"
fi

echo ""
echo "設定が完了しました。新しいシェルセッションで変更が反映されます。"
echo "または 'exec zsh' を実行して再読み込みしてください。"
