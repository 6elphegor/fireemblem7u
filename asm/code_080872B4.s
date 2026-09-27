	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080872B4
sub_080872B4: @ 0x080872B4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r6, [r0, #0x14]
	adds r0, r6, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080872D8
	ldr r3, _08087430 @ =0x08CC2FD8
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	movs r2, #9
	bl PutSprite
_080872D8:
	adds r5, r6, #0
	adds r5, #0x2e
	ldrb r2, [r5]
	movs r0, #0x34
	adds r1, r2, #0
	muls r1, r0, r1
	adds r1, #0x80
	ldr r3, _08087434 @ =0x08CC2E6C
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #0xc
	str r2, [sp]
	movs r0, #4
	movs r2, #0x1c
	bl PutSprite
	ldr r3, _08087438 @ =0x08CC2DF8
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8a
	movs r2, #0x83
	bl PutSprite
	ldr r3, _0808743C @ =0x08CC2E0E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x8b
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087440 @ =0x08CC2E1C
	str r4, [sp]
	movs r0, #4
	movs r1, #0xc0
	movs r2, #0x26
	bl PutSprite
	ldr r3, _08087444 @ =0x08CC2E2A
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x6a
	bl PutSprite
	ldr r3, _08087448 @ =0x08CC2E46
	str r4, [sp]
	movs r0, #4
	movs r1, #0x12
	movs r2, #0x7a
	bl PutSprite
	ldr r3, _0808744C @ =0x08CC2E4E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x63
	movs r2, #0x7c
	bl PutSprite
	ldr r3, _08087450 @ =0x08CC2E32
	str r4, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x30
	bl PutSprite
	adds r7, r5, #0
	movs r0, #0x34
	adds r0, r0, r6
	mov r8, r0
	adds r6, #0x2b
	mov sb, r6
	ldr r6, _08087454 @ =0x0000A3C0
	movs r5, #0xa0
	movs r4, #1
_0808736E:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x56
	ldr r3, _08087458 @ =0x08B905F8
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _0808736E
	ldr r3, _0808745C @ =0x08CC2E56
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x5f
	bl PutSprite
	ldr r3, _08087458 @ =0x08B905F8
	ldr r0, _08087460 @ =0x0000A3D0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb4
	movs r2, #0x61
	bl PutSprite
	ldr r3, _08087464 @ =0x08CC2E5E
	str r4, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x6c
	bl PutSprite
	ldr r6, _08087468 @ =0x0000A3D4
	movs r5, #0x9c
	movs r4, #1
_080873BA:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x6e
	ldr r3, _08087458 @ =0x08B905F8
	bl PutSprite
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080873BA
	ldr r4, _0808746C @ =0x02023086
	bl GetGameTime
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl PutTime
	movs r0, #1
	bl EnableBgSync
	ldrb r7, [r7]
	lsls r0, r7, #2
	add r0, r8
	ldr r3, [r0]
	cmp r3, #0
	beq _08087400
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x52
	bl PutUnitSprite
_08087400:
	bl SyncUnitSpriteSheet
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _0808741C
	ldr r3, _08087470 @ =0x08CC2E06
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd4
	movs r2, #3
	bl PutSprite
_0808741C:
	bl sub_080868F8
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08087430: .4byte 0x08CC2FD8
_08087434: .4byte 0x08CC2E6C
_08087438: .4byte 0x08CC2DF8
_0808743C: .4byte 0x08CC2E0E
_08087440: .4byte 0x08CC2E1C
_08087444: .4byte 0x08CC2E2A
_08087448: .4byte 0x08CC2E46
_0808744C: .4byte 0x08CC2E4E
_08087450: .4byte 0x08CC2E32
_08087454: .4byte 0x0000A3C0
_08087458: .4byte 0x08B905F8
_0808745C: .4byte 0x08CC2E56
_08087460: .4byte 0x0000A3D0
_08087464: .4byte 0x08CC2E5E
_08087468: .4byte 0x0000A3D4
_0808746C: .4byte 0x02023086
_08087470: .4byte 0x08CC2E06
