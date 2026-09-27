	.include "macro.inc"

	.syntax unified

	thumb_func_start EventDragonsSpritefx_Init
EventDragonsSpritefx_Init: @ 0x0807E440
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x6b
	movs r0, #0
	strb r0, [r1]
	movs r3, #0
	movs r4, #0
	subs r1, #0x33
	adds r5, r2, #0
	adds r5, #0x2c
	ldr r0, _0807E478 @ =0x0000FFFF
	adds r6, r0, #0
	adds r2, #0x5c
_0807E45C:
	stm r5!, {r4}
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	strh r4, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	cmp r3, #2
	ble _0807E45C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E478: .4byte 0x0000FFFF
