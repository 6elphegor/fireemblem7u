	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitSprites
RefreshUnitSprites: @ 0x08025724
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	ldr r0, _0802582C @ =0x0203A3CC
	ldr r1, _08025830 @ =0x02039F1C
	mov r2, r8
	str r2, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	strh r2, [r1, #6]
	adds r1, #0xc
	str r1, [r0]
	movs r7, #1
_08025744:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _080257EE
	ldr r0, [r6]
	cmp r0, #0
	beq _080257EE
	movs r0, #0
	str r0, [r6, #0x3c]
	ldr r0, [r6, #0xc]
	ldr r1, _08025834 @ =0x00000201
	ands r0, r1
	cmp r0, #0
	bne _080257EE
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	ldr r0, _08025838 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r6, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080257EE
	lsls r0, r2, #4
	bl AddUnitSprite
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #6]
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	lsls r0, r0, #4
	strh r0, [r5, #4]
	adds r0, r6, #0
	bl GetUnitSMSId
	bl UseUnitSprite
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetUnitDisplayedSpritePalette
	adds r4, #0x80
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	adds r4, r4, r1
	strh r4, [r5, #8]
	adds r0, r6, #0
	bl GetUnitSMSId
	ldr r2, _0802583C @ =0x08C99700
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r1, #2]
	adds r2, r0, #0
	strb r0, [r5, #0xb]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080257DA
	adds r0, r2, #3
	strb r0, [r5, #0xb]
_080257DA:
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r0, r1
	cmp r0, #0
	beq _080257EC
	ldrb r0, [r5, #0xb]
	adds r0, #0x40
	strb r0, [r5, #0xb]
_080257EC:
	str r5, [r6, #0x3c]
_080257EE:
	adds r7, #1
	cmp r7, #0xc5
	ble _08025744
	movs r0, #0
	bl GetTrap
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _080258B8
	ldr r1, _08025840 @ =0xFFFFC080
	adds r6, r1, #0
	ldr r7, _08025844 @ =0x08C99992
	movs r2, #0x28
	adds r2, r2, r7
	mov sb, r2
_0802580E:
	cmp r0, #1
	bne _08025882
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08025882
	ldrb r0, [r4, #3]
	cmp r0, #0x35
	beq _08025852
	cmp r0, #0x35
	bgt _08025848
	cmp r0, #0x34
	beq _0802584E
	b _08025864
	.align 2, 0
_0802582C: .4byte 0x0203A3CC
_08025830: .4byte 0x02039F1C
_08025834: .4byte 0x00000201
_08025838: .4byte 0x0202E3DC
_0802583C: .4byte 0x08C99700
_08025840: .4byte 0xFFFFC080
_08025844: .4byte 0x08C99992
_08025848:
	cmp r0, #0x36
	beq _08025856
	b _08025864
_0802584E:
	movs r0, #0x52
	b _08025858
_08025852:
	movs r0, #0x53
	b _08025858
_08025856:
	movs r0, #0x54
_08025858:
	bl UseUnitSprite
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_08025864:
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	mov r2, r8
	strh r2, [r5, #8]
	ldrh r0, [r7]
	strb r0, [r5, #0xb]
_08025882:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _080258B0
	ldrb r1, [r4, #1]
	lsls r0, r1, #4
	bl AddUnitSprite
	adds r5, r0, #0
	ldrb r2, [r4, #1]
	lsls r0, r2, #4
	strh r0, [r5, #6]
	ldrb r1, [r4]
	lsls r0, r1, #4
	strh r0, [r5, #4]
	movs r0, #0x57
	bl UseUnitSprite
	ldr r2, _080258D0 @ =0xFFFFB080
	adds r0, r0, r2
	strh r0, [r5, #8]
	mov r1, sb
	ldrh r0, [r1]
	strb r0, [r5, #0xb]
_080258B0:
	adds r4, #8
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802580E
_080258B8:
	ldr r0, _080258D4 @ =0x0203A3D0
	ldr r0, [r0]
	cmp r0, #0
	beq _080258C4
	bl ForceSyncUnitSpriteSheet
_080258C4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080258D0: .4byte 0xFFFFB080
_080258D4: .4byte 0x0203A3D0
