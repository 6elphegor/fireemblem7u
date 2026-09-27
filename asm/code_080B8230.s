	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8230
sub_080B8230: @ 0x080B8230
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	bl InitBgs
	bl InitFaces
	bl SetupCharacterEndingGfx
	ldr r3, _080B8284 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x44
	movs r1, #0
	movs r0, #0x10
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strh r1, [r4, #0x2e]
	mov r0, sp
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x40
	ldr r2, _080B8288 @ =0x01000010
	bl CpuSet
	ldr r0, _080B828C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _080B8294
	ldr r0, _080B8290 @ =0x08CEE630
	ldr r0, [r0, #4]
	b _080B8298
	.align 2, 0
_080B8284: .4byte 0x03002870
_080B8288: .4byte 0x01000010
_080B828C: .4byte 0x0202BBF8
_080B8290: .4byte 0x08CEE630
_080B8294:
	ldr r0, _080B82A8 @ =0x08CEE630
	ldr r0, [r0]
_080B8298:
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x34]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B82A8: .4byte 0x08CEE630
