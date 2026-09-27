	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD4F4
sub_080BD4F4: @ 0x080BD4F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	adds r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x30]
	adds r5, r1, r0
	str r5, [r4, #0x30]
	cmp r5, #0x4f
	ble _080BD51A
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	movs r1, #2
	bl Proc_Goto
	b _080BD534
_080BD51A:
	ldr r1, [r4, #0x2c]
	ldr r3, _080BD544 @ =0x08B905B0
	ldr r0, [r4, #0x34]
	movs r2, #1
	ands r0, r2
	movs r2, #0x88
	lsls r2, r2, #7
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
_080BD534:
	ldr r0, [r4, #0x34]
	adds r0, #1
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BD544: .4byte 0x08B905B0
