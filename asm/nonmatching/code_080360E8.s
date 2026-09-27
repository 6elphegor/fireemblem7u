	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFindClosestUnlockPosition
AiFindClosestUnlockPosition: @ 0x080360E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sl, r0
	mov r8, r1
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	ldr r0, _0803615C @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803610E
	b _080362D0
_0803610E:
	movs r4, #1
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0xc]
_08036116:
	ldr r0, _0803615C @ =0x0202E3D8
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _08036124
	b _080362C8
_08036124:
	lsls r2, r7, #2
	mov sb, r2
	mov r5, sp
	movs r4, #2
	mov r0, sl
	ands r0, r4
	str r0, [sp, #0x10]
_08036132:
	ldr r0, _08036160 @ =0x0202E3E8
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _08036144
	b _080362C0
_08036144:
	ldr r0, _08036164 @ =0x0202E3E0
	ldr r0, [r0]
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _08036168
	cmp r0, #0x21
	beq _08036198
	b _080362C0
	.align 2, 0
_0803615C: .4byte 0x0202E3D8
_08036160: .4byte 0x0202E3E8
_08036164: .4byte 0x0202E3E0
_08036168:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #8
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _0803617E
	b _080362C0
_0803617E:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, _08036194 @ =AiGetPositionRange
	mov r3, sp
	bl AiFindBestAdjacentPositionByFunc
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036192
	b _080362C0
_08036192:
	b _08036234
	.align 2, 0
_08036194: .4byte AiGetPositionRange
_08036198:
	ldr r0, [sp, #8]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #4
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080361AE
	b _080362C0
_080361AE:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, _08036228 @ =0x0202E3E4
	ldr r0, [r0]
	add r0, sb
	ldr r2, [r0]
	adds r2, r2, r6
	ldr r0, _0803622C @ =0x03004690
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldrb r2, [r2]
	cmp r2, r1
	bgt _08036234
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08036206
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _08036230 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036206
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080362C0
_08036206:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _0803621C
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080362C0
_0803621C:
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	b _08036308
	.align 2, 0
_08036228: .4byte 0x0202E3E4
_0803622C: .4byte 0x03004690
_08036230: .4byte 0x0202E3DC
_08036234:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0803626A
	movs r1, #2
	ldrsh r0, [r5, r1]
	ldr r1, _080362F8 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803626A
	ldr r0, _080362FC @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080362C0
_0803626A:
	ldr r4, [sp, #0x10]
	cmp r4, #0
	beq _08036280
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl AiCountNearbyEnemyUnits
	cmp r0, #0
	bne _080362C0
_08036280:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, _08036300 @ =0x0202E3E8
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _080362C0
	ldrh r0, [r5]
	mov r4, r8
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #4]
_080362C0:
	subs r6, #1
	cmp r6, #0
	blt _080362C8
	b _08036132
_080362C8:
	subs r7, #1
	cmp r7, #0
	blt _080362D0
	b _08036116
_080362D0:
	movs r0, #0
	cmp r0, #0
	bne _080362DE
	ldr r0, _08036304 @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_080362DE:
	ldr r4, [sp, #8]
	cmp r4, #0
	bne _080362EC
	ldr r0, _08036304 @ =0x0203A8EC
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
_080362EC:
	ldr r0, [sp, #4]
	cmp r0, #0xff
	bne _08036308
	movs r0, #0
	b _0803630A
	.align 2, 0
_080362F8: .4byte 0x0202E3DC
_080362FC: .4byte 0x03004690
_08036300: .4byte 0x0202E3E8
_08036304: .4byte 0x0203A8EC
_08036308:
	movs r0, #1
_0803630A:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
