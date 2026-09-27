	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A28CC
sub_080A28CC: @ 0x080A28CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A2908 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A28E4
	movs r0, #0xe6
	lsls r0, r0, #2
	bl m4aSongNumStart
_080A28E4:
	adds r0, r4, #0
	bl Minimap_InitProcVars
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl ApplyMinimapGraphics
	movs r0, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	movs r0, #3
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A2908: .4byte 0x0202BBF8
