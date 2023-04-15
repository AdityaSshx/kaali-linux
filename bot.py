import asyncio
from pyrogram import Client, compose,idle

import os
from aiohttp import web
from os import environ 
PORT = environ.get("PORT", "8080"


async def web_server():
    web_app = web.Application(client_max_size=30000000)
    web_app.add_routes(routes)
    return web_app

routes = web.RouteTableDef()
@routes.get("/", allow_head=True)
async def root_route_handler(request):
    return web.json_response("testbot")

