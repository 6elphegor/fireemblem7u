	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC174
sub_080AC174: @ 0x080AC174
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AC216
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AC1B4
	ldr r0, _080AC1B0 @ =0x08CE4D28
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	blt _080AC1B4
	adds r0, r4, #0
	bl PlayNextShuffledSong
	b _080AC216
	.align 2, 0
_080AC1B0: .4byte 0x08CE4D28
_080AC1B4:
	ldr r0, _080AC1CC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AC1D0
	adds r0, r4, #0
	bl sub_080AB1C8
	b _080AC216
	.align 2, 0
_080AC1CC: .4byte 0x08B857F8
_080AC1D0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AC1E0
	adds r0, r4, #0
	bl sub_080AB228
	b _080AC216
_080AC1E0:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080AC1F0
	adds r0, r4, #0
	bl Proc_Break
	b _080AC216
_080AC1F0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080AC206
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080AC216
_080AC206:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AC216
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AC216:
	pop {r4}
	pop {r0}
	bx r0
