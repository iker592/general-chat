# Makefile for LangGraph + CopilotKit project

.PHONY: help setup local dev clean install-agent install-ui test lint

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup     - Install all dependencies (Node.js + Python)"
	@echo "  make local     - Start both UI and agent servers"
	@echo "  make dev       - Start development servers (alias for local)"
	@echo "  make ui        - Start only the Next.js UI server"
	@echo "  make agent     - Start only the LangGraph agent server"
	@echo "  make install-ui - Install Node.js dependencies"
	@echo "  make install-agent - Install Python dependencies with uv"
	@echo "  make test      - Run tests"
	@echo "  make lint      - Run linting"
	@echo "  make clean     - Clean build artifacts and dependencies"

# Install all dependencies
setup: install-ui install-agent
	@echo "✅ All dependencies installed!"

# Install Node.js dependencies
install-ui:
	@echo "📦 Installing Node.js dependencies..."
	pnpm install
	@echo "✅ Node.js dependencies installed!"

# Install Python dependencies
install-agent:
	@echo "🐍 Installing Python dependencies with uv..."
	uv sync
	@echo "✅ Python dependencies installed!"

# Start both servers
local: dev

# Start both servers (development mode)
dev:
	@echo "🚀 Starting development servers..."
	pnpm dev

# Start only UI server
ui:
	@echo "🎨 Starting Next.js UI server..."
	pnpm run dev:ui

# Start only agent server
agent:
	@echo "🤖 Starting LangGraph agent server..."
	pnpm run dev:agent

# Run tests
test:
	@echo "🧪 Running tests..."
	pnpm test

# Run linting
lint:
	@echo "🔍 Running linting..."
	pnpm lint

# Clean build artifacts and dependencies
clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -rf .next/
	rm -rf node_modules/
	rm -rf .venv/
	rm -rf dist/
	rm -rf build/
	@echo "✅ Cleaned!"

# Production build
build:
	@echo "🏗️  Building for production..."
	pnpm build
	@echo "✅ Production build complete!"

# Start production server
start:
	@echo "🚀 Starting production server..."
	pnpm start
