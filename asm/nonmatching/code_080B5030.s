	.include "macro.inc"

	.syntax unified

	thumb_func_start WorldMap_Init
WorldMap_Init: @ 0x080B5030
	push {r4, lr}
	sub sp, #0x20
	mov r1, sp
	ldr r0, _080B50B8 @ =0x085E9AA0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	movs r0, #0
	bl InitBgs
	ldr r4, _080B50BC @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r3, [r4, #0x10]
	ands r1, r3
	movs r0, #1
	orrs r1, r0
	strb r1, [r4, #0x10]
	movs r0, #3
	ldrb r1, [r4, #0x14]
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl UnpackUiWindowFrameGraphics
	bl ResetText
	bl InitFaces
	mov r0, sp
	bl SetFaceConfig
	bl ResetUnitSprites
	bl MU_Init
	bl ApplyUnitSpritePalettes
	ldr r1, _080B50C0 @ =0x0202BBB8
	movs r0, #0
	strh r0, [r1, #0xc]
	strh r0, [r1, #0xe]
	subs r0, #2
	ldrb r2, [r4, #1]
	ands r0, r2
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	add sp, #0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B50B8: .4byte 0x085E9AA0
_080B50BC: .4byte 0x03002870
_080B50C0: .4byte 0x0202BBB8
