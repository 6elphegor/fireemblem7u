	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxVSync
WfxVSync: @ 0x0802DDD0
	push {lr}
	ldr r0, _0802DDE8 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	subs r0, #1
	cmp r0, #6
	bhi _0802DE34
	lsls r0, r0, #2
	ldr r1, _0802DDEC @ =_0802DDF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DDE8: .4byte 0x0202BBF8
_0802DDEC: .4byte _0802DDF0
_0802DDF0: @ jump table
	.4byte _0802DE0C @ case 0
	.4byte _0802DE18 @ case 1
	.4byte _0802DE24 @ case 2
	.4byte _0802DE1E @ case 3
	.4byte _0802DE2A @ case 4
	.4byte _0802DE12 @ case 5
	.4byte _0802DE30 @ case 6
_0802DE0C:
	bl WfxSnow_VSync
	b _0802DE34
_0802DE12:
	bl WfxSandStorm_VSync
	b _0802DE34
_0802DE18:
	bl WfxSnowStorm_VSync
	b _0802DE34
_0802DE1E:
	bl WfxRain_VSync
	b _0802DE34
_0802DE24:
	bl nullsub_9
	b _0802DE34
_0802DE2A:
	bl WfxFlames_VSync
	b _0802DE34
_0802DE30:
	bl WfxClouds_VSync
_0802DE34:
	pop {r0}
	bx r0
