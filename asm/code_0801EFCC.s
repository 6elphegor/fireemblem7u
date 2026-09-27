	.include "macro.inc"

	.syntax unified

	thumb_func_start StartShowMapChangeAnim
StartShowMapChangeAnim: @ 0x0801EFCC
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r4, r2, #0
	ldr r0, _0801EFF4 @ =0x08B9389C
	bl Proc_StartBlocking
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetTrap
	adds r1, r0, #0
	movs r0, #1
	ldrb r2, [r1, #3]
	eors r0, r2
	strb r0, [r1, #3]
	cmp r0, #0
	beq _0801EFF8
	ldrb r0, [r1, #1]
	b _0801EFFA
	.align 2, 0
_0801EFF4: .4byte 0x08B9389C
_0801EFF8:
	ldrb r0, [r1]
_0801EFFA:
	str r0, [r5, #0x2c]
	ldrb r0, [r1, #3]
	str r0, [r5, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
