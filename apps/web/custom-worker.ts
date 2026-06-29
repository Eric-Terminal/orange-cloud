// 自用部署只复用 OpenNext 生成的 fetch 处理器，不启用官方构建里的榜单 cron / IAP D1 绑定。

// @ts-expect-error .open-next/worker.js 在 `opennextjs-cloudflare build` 时生成
import { default as handler } from "./.open-next/worker.js";

export default {
	fetch: handler.fetch,
} satisfies ExportedHandler<CloudflareEnv>;

// 再导出生成 worker 的 Durable Object 类（OpenNext 缓存层用；全量再导出以兼容后续启用缓存）。
// @ts-expect-error .open-next/worker.js 在 build 时生成
export { DOQueueHandler, DOShardedTagCache, BucketCachePurge } from "./.open-next/worker.js";
