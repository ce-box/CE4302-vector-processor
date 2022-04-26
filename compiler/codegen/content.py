class Content:
    __content: str = ''
    def read_content() -> str:
        """
        Reads content
        Returns:
        content -- content to be readed
        """
        return Content.__content
    def write_line_content(new_content) -> None:
        """
        Writes content
        Returns:
        content -- content to be written
        """
        Content.__content = Content.__content + new_content + '\n'
    def write_content(new_content) -> None:
        """
        Writes content
        Returns:
        content -- content to be written
        """
        Content.__content = Content.__content + new_content