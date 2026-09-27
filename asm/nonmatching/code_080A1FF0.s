	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMinimapConnectKindAt
GetMinimapConnectKindAt: @ 0x080A1FF0
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080A2040 @ =0x0202E3E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r0, r4
	ldrb r3, [r5]
	ldr r0, [r1, #4]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2010
	movs r2, #1
_080A2010:
	lsls r2, r2, #1
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2020
	adds r2, #1
_080A2020:
	lsls r2, r2, #1
	ldrb r0, [r5, #1]
	cmp r0, r3
	bne _080A202A
	adds r2, #1
_080A202A:
	lsls r2, r2, #1
	subs r0, r5, #1
	ldrb r0, [r0]
	cmp r0, r3
	bne _080A2036
	adds r2, #1
_080A2036:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A2040: .4byte 0x0202E3E0
