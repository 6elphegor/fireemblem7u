	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8874
sub_080B8874: @ 0x080B8874
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0x1e
	ldr r0, _080B88B8 @ =0x08CEE91C
	ldr r1, [r5, #0x34]
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r1, #1
	str r1, [r5, #0x34]
	ldr r0, [r5, #0x38]
	ldrb r0, [r0, #1]
	cmp r0, #0xcd
	beq _080B88A0
	subs r1, r6, r4
	lsls r1, r1, #3
	adds r1, #0xb0
	ldr r0, _080B88BC @ =0x000001FF
	ands r1, r0
	movs r0, #0
	movs r2, #0x38
	bl SetFacePosition
_080B88A0:
	subs r0, r6, r4
	movs r1, #0
	bl sub_080B8160
	cmp r4, #0x1e
	bne _080B88B2
	adds r0, r5, #0
	bl Proc_Break
_080B88B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B88B8: .4byte 0x08CEE91C
_080B88BC: .4byte 0x000001FF
