from kitty.boss import Boss


def main(args: list[str]) -> str:
    """
    this is the main entry point of the kitten, it will be executed in
    the overlay window when the kitten is launched

    whatever this function returns will be available in the
    handle_result() function
    """

    try:
        answer = input("Enter new workspace name: ")
    except SystemExit:
        return ""
    except EOFError:
        return ""
    except KeyboardInterrupt:
        return ""

    return answer


def handle_result(
    args: list[str], answer: str, target_window_id: int, boss: Boss
) -> None:
    wm_names = [tm.wm_name for tm in boss.os_window_map.values()]
    if answer in wm_names:
        # so fucking dumb how i cant access boss in main
        boss.launch("--type", "overlay", "sh", "-c", "read -p 'Name already exists. \nPress enter to exit...'")
        return
    if not answer:
        return
    tm = boss.active_tab_manager
    tm.wm_name = answer
