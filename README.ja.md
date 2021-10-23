![SwiftUINibbles_icon](https://user-images.githubusercontent.com/25205138/138544376-67aece95-1ff9-4697-807b-2763712a8d6f.jpeg)

SwiftUINibblesは、SwiftUIのコンポーネント集です。

# Contents
- TBD

# パッケージ内のディレクトリ構成における制限事項

SwiftUINibblesは、コンポーネント集のため、様々な思想のレイアウトを実装します。
そのため、パッケージ内のDesignSystem直下にはカラーやフォントなど汎用的に使用できるもののみを定義して、ButtonStyleなどは各コンポーネント内に定義していく予定です。

実際のプロダクト開発では、プロダクト全体で統一されたButtonStyleなどを使用するケースが多いと思われるので、DesignSystem直下にStyleを定義してコンポーネント側ではそれらを呼び出すような使い方になるかと思います。
