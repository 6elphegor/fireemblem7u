	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_StartMainBodyFallIn
EkrDragon_StartMainBodyFallIn: @ 0x08064FE4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08065020 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _08065024
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingBg
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingObj
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonBg2ScrollExt
	str r0, [r6, #0x4c]
	bl NewEkrDragonBg2ScrollHandler
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFireBG2
	str r0, [r6, #0x48]
	adds r0, r6, #0
	bl Proc_Break
	b _080650E6
	.align 2, 0
_08065020: .4byte 0x0203E02C
_08065024:
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080650E6
	strh r1, [r6, #0x2c]
	movs r0, #0x80
	strh r0, [r6, #0x2e]
	movs r0, #0x20
	strh r0, [r6, #0x3a]
	strh r1, [r6, #0x3c]
	ldr r0, [r6, #0x5c]
	bl NewEfxDragonDeadFallBody
	str r0, [r6, #0x64]
	ldr r1, [r6, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #0x32]
	ldr r1, [r6, #0x64]
	ldr r0, [r6, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r6, #0x3a]
	subs r0, r0, r2
	strh r0, [r1, #0x3a]
	movs r0, #8
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	movs r1, #0x9d
	lsls r1, r1, #1
	bl NewEkrDragonFireBg3
	ldr r0, _080650F0 @ =0x082E1218
	ldr r4, _080650F4 @ =0x02019784
	adds r1, r4, #0
	bl LZ77UnCompWram
	ldr r5, _080650F8 @ =0x001F001F
	str r5, [sp]
	movs r0, #0xf0
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r2, _080650FC @ =0x05000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	adds r0, r5, #0
	bl EfxTmFill
	ldr r0, _08065100 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065104 @ =0x0201FB00
	ldr r0, [r0]
	movs r2, #0x3a
	ldrsh r1, [r6, r2]
	bl EkrDragonTmCpyExt
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingBg
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFlashingWingObj
	str r0, [r6, #0x44]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonBg2ScrollExt
	str r0, [r6, #0x4c]
	bl NewEkrDragonBg2ScrollHandler
	str r0, [r6, #0x58]
	ldr r0, [r6, #0x5c]
	bl NewEkrDragonFireBG2
	str r0, [r6, #0x48]
	movs r0, #0xbc
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r6, #0
	bl Proc_Break
_080650E6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080650F0: .4byte 0x082E1218
_080650F4: .4byte 0x02019784
_080650F8: .4byte 0x001F001F
_080650FC: .4byte 0x05000020
_08065100: .4byte 0x02024460
_08065104: .4byte 0x0201FB00
