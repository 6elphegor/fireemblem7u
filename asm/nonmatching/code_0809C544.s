	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSupportSubScreenSprites
DrawSupportSubScreenSprites: @ 0x0809C544
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r5, _0809C634 @ =0x000001FF
	ands r1, r5
	ldr r3, _0809C638 @ =0x08CC593C
	movs r4, #0xe0
	lsls r4, r4, #2
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa8
	ands r1, r5
	ldr r3, _0809C63C @ =0x08CC5944
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc8
	ands r1, r5
	ldr r3, _0809C640 @ =0x08CC5952
	str r4, [sp]
	movs r0, #4
	movs r2, #0xa
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r5
	ldr r3, _0809C644 @ =0x08CC5960
	ldr r4, _0809C648 @ =0x0000E280
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xa0
	ands r1, r5
	ldr r3, _0809C64C @ =0x08CC596E
	str r4, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r5
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _0809C60E
	adds r5, r2, #0
_0809C5C8:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x40
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809C5DC
	movs r3, #0xd0
	lsls r3, r3, #8
_0809C5DC:
	cmp r0, #2
	bne _0809C5E4
	movs r3, #0xf0
	lsls r3, r3, #8
_0809C5E4:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4e
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutUnitSpriteForClassId
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809C5C8
_0809C60E:
	ldr r1, [r6, #0x30]
	adds r1, #8
	ldr r0, _0809C634 @ =0x000001FF
	ands r1, r0
	ldr r3, _0809C650 @ =0x08CC4FC4
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	bl SyncUnitSpriteSheet
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C634: .4byte 0x000001FF
_0809C638: .4byte 0x08CC593C
_0809C63C: .4byte 0x08CC5944
_0809C640: .4byte 0x08CC5952
_0809C644: .4byte 0x08CC5960
_0809C648: .4byte 0x0000E280
_0809C64C: .4byte 0x08CC596E
_0809C650: .4byte 0x08CC4FC4
