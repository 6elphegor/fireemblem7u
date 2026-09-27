	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AEBC
sub_0809AEBC: @ 0x0809AEBC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r3, _0809AEF4 @ =0x020229A2
	ldr r5, _0809AEF8 @ =0x0202BBF8
	adds r1, r4, #0
	adds r1, #0x2c
	movs r2, #0xe
_0809AECA:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _0809AECA
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809AEEA
	movs r0, #0xee
	bl m4aSongNumStart
_0809AEEA:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AEF4: .4byte 0x020229A2
_0809AEF8: .4byte 0x0202BBF8
