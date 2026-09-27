	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3C18
sub_080B3C18: @ 0x080B3C18
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _080B3C50 @ =0x08CE7630
	bl Proc_Find
	cmp r0, #0
	beq _080B3C48
	lsls r1, r4, #3
	adds r0, #0x30
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r2, #0
	beq _080B3C48
	ldr r0, _080B3C54 @ =0x02000000
	movs r3, #4
	ldrsh r1, [r0, r3]
	subs r1, r5, r1
	str r1, [r2, #0x54]
	movs r1, #6
	ldrsh r0, [r0, r1]
	subs r0, r6, r0
	str r0, [r2, #0x58]
_080B3C48:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3C50: .4byte 0x08CE7630
_080B3C54: .4byte 0x02000000
