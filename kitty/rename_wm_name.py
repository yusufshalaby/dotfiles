from kitty.boss import Boss


def main(args: list[str]) -> str:
    # this is the main entry point of the kitten, it will be executed in
    # the overlay window when the kitten is launched
    answer = input("Enter new workspace name: ")
    # whatever this function returns will be available in the
    # handle_result() function
    return answer


def handle_result(
    args: list[str], answer: str, target_window_id: int, boss: Boss
) -> None:
    tm = boss.active_tab_manager
    tm.wm_name = answer
