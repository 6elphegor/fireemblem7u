	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A31A4
sub_080A31A4: @ 0x080A31A4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_080A2F38
	adds r0, r4, #0
	bl sub_080A2F74
	adds r0, r4, #0
	bl sub_080A3004
	adds r0, r4, #0
	bl Minimap_PutViewport
	adds r0, r4, #0
	bl sub_080A3080
	ldr r0, _080A3208 @ =0x08B857F8
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #2
	ldrh r0, [r0, #4]
	ands r3, r0
	cmp r3, #0
	beq _080A3218
	ldr r2, _080A320C @ =0x030028AC
	ldr r0, _080A3210 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _080A3214 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	movs r0, #8
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r1, [r2, #0xa]
	b _080A3244
	.align 2, 0
_080A3208: .4byte 0x08B857F8
_080A320C: .4byte 0x030028AC
_080A3210: .4byte 0x0000FFE0
_080A3214: .4byte 0x0000E0FF
_080A3218:
	ldr r2, _080A326C @ =0x030028AC
	ldr r0, _080A3270 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A3274 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
_080A3244:
	ldr r0, _080A3278 @ =0x0202BBB8
	ldr r0, [r0, #0xc]
	ldr r1, _080A327C @ =0x000F000F
	ands r0, r1
	cmp r0, #0
	bne _080A3264
	ldr r0, _080A3280 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A3264
	adds r0, r4, #0
	bl Proc_Break
_080A3264:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A326C: .4byte 0x030028AC
_080A3270: .4byte 0x0000FFE0
_080A3274: .4byte 0x0000E0FF
_080A3278: .4byte 0x0202BBB8
_080A327C: .4byte 0x000F000F
_080A3280: .4byte 0x08B857F8
