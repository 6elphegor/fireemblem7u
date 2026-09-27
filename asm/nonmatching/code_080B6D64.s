	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B6D64
sub_080B6D64: @ 0x080B6D64
	push {r4, r5, lr}
	ldr r0, _080B6D8C @ =0x08CEDE00
	ldr r4, [r0]
	ldr r1, _080B6D90 @ =0x02000884
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080B6DC2
	adds r5, r1, #0
_080B6D78:
	ldr r2, [r4, #8]
	ldr r0, [r2]
	cmp r0, #0xcd
	bne _080B6D94
	movs r0, #9
	strb r0, [r4, #4]
	ldr r0, [r5]
	adds r0, #9
	str r0, [r5]
	b _080B6DBA
	.align 2, 0
_080B6D8C: .4byte 0x08CEDE00
_080B6D90: .4byte 0x02000884
_080B6D94:
	cmp r0, #3
	beq _080B6DBA
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _080B6DA4
	ldr r0, [r2, #8]
	b _080B6DA6
_080B6DA4:
	ldr r0, [r2, #4]
_080B6DA6:
	bl DecodeMsg
	bl CountEpilogueLines
	strb r0, [r4, #4]
	ldr r0, [r5]
	ldrb r1, [r4, #4]
	adds r0, r1, r0
	str r0, [r5]
	ldr r1, _080B6DD0 @ =0x02000884
_080B6DBA:
	adds r4, #0xc
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _080B6D78
_080B6DC2:
	ldr r0, [r1]
	adds r0, #5
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6DD0: .4byte 0x02000884
