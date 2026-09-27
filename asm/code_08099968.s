	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099968
sub_08099968: @ 0x08099968
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x3b
	ldrb r0, [r0]
	cmp r0, #0
	beq _08099A2A
	movs r0, #0
	mov r8, r0
	movs r1, #0x34
	adds r1, r1, r7
	mov sb, r1
	adds r2, r7, #0
	adds r2, #0x3e
	str r2, [sp, #4]
_0809998E:
	mov r3, sb
	add r3, r8
	ldrb r0, [r3]
	movs r4, #1
	add r4, r8
	mov sl, r4
	cmp r0, #0xff
	beq _080999F0
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r2, r0, #0
	adds r2, #0x34
	ldr r0, _08099A3C @ =0x000001FF
	ands r2, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r4, #0
	ldrsh r1, [r0, r4]
	mov r4, r8
	lsls r0, r4, #4
	adds r0, #0x19
	adds r6, r1, r0
	movs r0, #0xff
	ands r6, r0
	movs r5, #0
	ldrb r3, [r3]
	cmp r5, r3
	bgt _080999F0
	adds r4, r2, #0
_080999CC:
	lsls r0, r5, #2
	ldr r1, _08099A40 @ =0x08CC5100
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r0, _08099A44 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	bl PutSpriteExt
	adds r4, #0xa
	adds r5, #1
	mov r0, sb
	add r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	ble _080999CC
_080999F0:
	mov r8, sl
	mov r0, r8
	cmp r0, #4
	ble _0809998E
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _08099A2A
	adds r0, r7, #0
	adds r0, #0x52
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r1, #0xc0
	ldr r0, _08099A3C @ =0x000001FF
	ands r1, r0
	adds r0, r7, #0
	adds r0, #0x54
	movs r3, #0
	ldrsh r2, [r0, r3]
	adds r2, #0x1c
	movs r0, #0xff
	ands r2, r0
	ldr r0, _08099A40 @ =0x08CC5100
	ldr r3, [r0]
	ldr r0, _08099A44 @ =0x0000F380
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_08099A2A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099A3C: .4byte 0x000001FF
_08099A40: .4byte 0x08CC5100
_08099A44: .4byte 0x0000F380
