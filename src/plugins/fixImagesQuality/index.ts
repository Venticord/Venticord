/*
 * Vencord, a Discord client mod
 * Copyright (c) 2023 Vendicated and contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import { Devs } from "@utils/constants";
import definePlugin from "@utils/types";

export default definePlugin({
    name: "FixImagesQuality",
    description: "Fixes the quality of images in the chat being horrible.",
    authors: [Devs.Nuckyz],
    patches: [
        {
            find: "handleImageLoad=",
            replacement: {
                match: /(?<=getSrc\(\i\){.+?format:)\i/,
                replace: "null"
            }
        }
    ]
<<<<<<< HEAD
});
=======
});
>>>>>>> ec16fd874189411479890e00d93770001f9d09ab
