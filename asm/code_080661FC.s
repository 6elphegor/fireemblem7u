	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTunk_Loop1
EkrDragonTunk_Loop1: @ 0x080661FC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08066228
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrDragonScreenFlashing
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066228:
	ldrh r0, [r5, #0x2c]
	cmp r0, #0x23
	bne _08066246
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrDragonScreenFlashing
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066246:
	ldrh r1, [r5, #0x2c]
	cmp r1, #0x32
	bne _08066264
	movs r0, #3
	movs r1, #2
	movs r2, #3
	bl NewEkrDragonScreenFlashing
	ldr r0, _080662E0 @ =0x00000147
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08066264:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x36
	bne _080662C2
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	movs r4, #0x80
	lsls r4, r4, #1
	strh r4, [r5, #0x3a]
	strh r6, [r5, #0x3c]
	ldr r0, [r5, #0x5c]
	bl NewEfxDragonDeadFallHeadFx
	str r0, [r5, #0x64]
	ldr r1, [r5, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x16
	strh r1, [r0, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	ldrh r2, [r5, #0x3a]
	subs r0, r0, r2
	adds r0, #0xd8
	strh r0, [r1, #0x3a]
	ldr r0, _080662E4 @ =0x082E1218
	ldr r1, _080662E8 @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _080662EC @ =0x001F001F
	bl EfxTmFill
	ldr r0, _080662F0 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	movs r1, #0xf0
	bl sub_080660CC
	movs r0, #0
	adds r1, r4, #0
	bl sub_08066164
_080662C2:
	ldrh r2, [r5, #0x2c]
	cmp r2, #0x64
	bne _080662D8
	strh r6, [r5, #0x2c]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r5, #0x2e]
	strh r6, [r5, #0x30]
	adds r0, r5, #0
	bl Proc_Break
_080662D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080662E0: .4byte 0x00000147
_080662E4: .4byte 0x082E1218
_080662E8: .4byte 0x02019784
_080662EC: .4byte 0x001F001F
_080662F0: .4byte 0x02024460
