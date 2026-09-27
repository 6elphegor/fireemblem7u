	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7B74
sub_080B7B74: @ 0x080B7B74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080B7BC0 @ =0x08CEDC98
	movs r1, #2
	adds r2, r4, #0
	bl sub_080B73EC
	movs r1, #0
	bl Proc_Goto
	bl ClearEpilogueTexts
	adds r4, #0x44
	movs r2, #0
	movs r3, #0
	ldr r0, _080B7BC4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r5, [r1]
	ands r0, r5
	strb r0, [r1]
	adds r1, #8
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r3, [r4]
	movs r0, #0
	bl SetOnHBlankA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B7BC0: .4byte 0x08CEDC98
_080B7BC4: .4byte 0x03002870
