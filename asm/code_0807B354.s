	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlamefx_Handler
DragonFlamefx_Handler: @ 0x0807B354
	push {lr}
	ldr r1, [r0, #0x58]
	adds r1, #1
	str r1, [r0, #0x58]
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _0807B380
	movs r0, #0x1f
	ands r1, r0
	cmp r1, #0
	bne _0807B380
	ldr r0, _0807B384 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B380
	movs r0, #0xf8
	bl m4aSongNumStart
_0807B380:
	pop {r0}
	bx r0
	.align 2, 0
_0807B384: .4byte 0x0202BBF8
