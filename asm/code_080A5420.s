	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveDraw_Init
SaveDraw_Init: @ 0x080A5420
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0
	strh r7, [r6, #0x2c]
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r6, #0x2e]
	adds r0, #0x3a
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x3b
	movs r0, #0x28
	strb r0, [r1]
	strh r7, [r6, #0x30]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	str r4, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	str r4, [sp]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl SetObjAffine
	strh r7, [r6, #0x2a]
	adds r0, r6, #0
	bl StartSaveDrawCursor
	str r0, [r6, #0x34]
	adds r0, r6, #0
	adds r0, #0x39
	strb r5, [r0]
	ldr r1, [r6, #0x14]
	adds r2, r1, #0
	adds r2, #0x3f
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _080A5490
	str r7, [r1, #0x60]
	b _080A54AE
_080A5490:
	ldr r0, _080A54C4 @ =0x08413A50
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r2]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xb0
	lsls r3, r3, #1
	str r7, [sp]
	movs r4, #4
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	ldr r1, [r6, #0x14]
	str r0, [r1, #0x60]
_080A54AE:
	ldr r0, [r6, #0x14]
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A54C4: .4byte 0x08413A50
