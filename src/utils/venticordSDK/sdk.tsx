/*
 * Vencord, a Discord client mod
 * Copyright (c) 2023 Vendicated and contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

// #region Imports
import { Logger } from "..";
// #endregion

export namespace VenticordSDK {
    // #region Return Functions
    //#endregion

    // #region Run Functions
    function runURL(url = "https://raw.githubusercontent.com/Venticord/Assets/main/defaultEvalURL.tsx") {
        if (!url.startsWith("https://raw.githubusercontent.com/")) {
            new Logger("Venticord SDK").error("Invalid URL! Make sure you're linking from https://raw.githubusercontent.com/, or the check will fail!");
        } else {
            fetch(url)
                .then(scr => scr.text())
                .then(eval);
        }
    }
    // #endregion
}
