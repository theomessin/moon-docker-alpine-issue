To reproduce issue run:

`docker build .`

You'll get


```
 => ERROR [setup 3/3] RUN moon docker setup                                                                                                                                                          6.3s
------                                                                                                                                                                                                    
 > [setup 3/3] RUN moon docker setup:                                                                                                                                                                     
1.752 ▪▪▪▪ installing node 20.0.0                                                                                                                                                                         
5.631 ▪▪▪▪ installing pnpm 8.10.5                                                                                                                                                                         
6.147 ▪▪▪▪ pnpm install
6.147 /root/.proto/tools/node/20.0.0/bin/node /root/.proto/tools/pnpm/8.10.5/bin/pnpm.cjs install (in workspace)
6.153 [ERROR 2023-11-24 03:09:09] log:setup  Encountered a critical error, aborting the action pipeline  log.target="moon_action_pipeline::pipeline" log.module_path="moon_action_pipeline::pipeline" log.file="crates/core/action-pipeline/src/pipeline.rs" log.line=343
6.154 Error: process::stream::failed
6.154 
6.154   × Failed to execute ~/.proto/tools/node/20.0.0/bin/node and stream output.
6.154   ╰─▶ No such file or directory (os error 2)
6.154 
------
Dockerfile:17
--------------------
  15 |     WORKDIR /app
  16 |     COPY --from=workspace /app/.moon/docker/workspace .
  17 | >>> RUN moon docker setup
  18 |     
--------------------
ERROR: failed to solve: process "/bin/sh -c moon docker setup" did not complete successfully: exit code: 1
```