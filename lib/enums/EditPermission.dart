enum EditPermission {
  READ,
  EDIT,
  ADMIN;

  String toDisplayString() {
    switch (this) {
      case EditPermission.READ:
        return '읽기';
      case EditPermission.EDIT:
        return '편집';
      case EditPermission.ADMIN:
        return '관리자';
    }
  }
}