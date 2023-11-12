# The VenticordSDK
Venticord has a built in SDK! You can see how it's used below, with comments along the way!
```tsx
import definePlugin from "@utils/types";
import { VenticordSDK } from "@utils/venticordSDK/sdk";

export default definePlugin({
    name: "Venticord SDK Plugin",
    description: "This plugin is absolutely Venticord SDK",
    authors: [
        {
            id: 12345n,
            name: "Your Name",
        },
    ],
    patches: [],
    start() {
        runURL("https://raw.githubusercontent.com/Venticord/Assets/main/docsEvalURL.tsx"); // this will evaluate the code inside the URL. for safety reasons, this only works on raw.githubusercontent.com links. if no url is provided, it defaults to running an error script. 
    },
    stop() {},
});
```
