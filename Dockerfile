FROM node:alpine AS base
WORKDIR /app
RUN npm install -g @moonrepo/cli
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

# # #
FROM base AS workspace
WORKDIR /app
COPY . .
RUN moon docker scaffold app


# # #
FROM base AS setup
WORKDIR /app
COPY --from=workspace /app/.moon/docker/workspace .
RUN moon docker setup
