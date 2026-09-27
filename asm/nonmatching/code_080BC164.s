	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC164
sub_080BC164: @ 0x080BC164
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r7, _080BC1F8 @ =0x03002870
	adds r1, r7, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r2, _080BC1FC @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BC200 @ =0xFFFFFE1E
	ands r0, r1
	str r0, [r2]
	str r4, [sp]
	ldr r1, _080BC204 @ =0x06017000
	ldr r6, _080BC208 @ =0x01000400
	mov r0, sp
	adds r2, r6, #0
	bl CpuFastSet
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r7, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
	ldr r0, _080BC20C @ =0x085E9D2C
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080BC210 @ =0x085EC9A4
	movs r1, #0
	bl sub_080BCB1C
	ldr r0, _080BC214 @ =0x085ECBC0
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_080BCB1C
	str r4, [r5, #0x2c]
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _080BC218 @ =0x06014000
	adds r2, r6, #0
	bl CpuFastSet
	adds r5, #0x3c
	movs r0, #1
	strb r0, [r5]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC1F8: .4byte 0x03002870
_080BC1FC: .4byte 0x03001620
_080BC200: .4byte 0xFFFFFE1E
_080BC204: .4byte 0x06017000
_080BC208: .4byte 0x01000400
_080BC20C: .4byte 0x085E9D2C
_080BC210: .4byte 0x085EC9A4
_080BC214: .4byte 0x085ECBC0
_080BC218: .4byte 0x06014000
