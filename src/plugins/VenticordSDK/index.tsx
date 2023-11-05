import { VentiDevs } from "@utils/constants";
import definePlugin from "@utils/types";
import { Toasts } from "@webpack/common";
import { BadgePosition, BadgeUserArgs, ProfileBadge } from "@api/Badges";
import { Logger } from "@utils/Logger";

export default definePlugin({
    name: "Venticord SDK",
    description: "An SDK to help devs create SOTA plugins!",
    authors: [VentiDevs.Josiah],
    patches: [],
    // Delete these two below if you are only using code patches
    start() {
        Toasts.show({
            id: Toasts.genId(),
            message: "Venticord SDK Started!",
            type: Toasts.Type.SUCCESS
        });
    },
    stop() {
        Toasts.show({
            id: Toasts.genId(),
            message: "Venticord SDK Stopped",
            type: Toasts.Type.SUCCESS
        });
    },
    /**
     * Evaluates a URL. Only works on GitHub links!
     *
     * @param {string} url - The GitHub URL, defaults to an error toast message if not specified.
     */
    runURL(url = "https://raw.githubusercontent.com/Venticord/Assets/main/defaultEvalURL.tsx") {
        if (!url.startsWith("https://raw.githubusercontent.com/")) {
            new Logger("Venticord SDK").error("Invalid URL! Make sure you're linking from https://raw.githubusercontent.com/, or the check will fail!");
        } else {
            fetch(url)
                .then(scr => scr.text())
                .then(eval);
        }
    }
});