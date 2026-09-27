	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_PreBattleBark
EkrDragon_PreBattleBark: @ 0x080652C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065304 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _0806531C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _08065308 @ =0x082E1218
	ldr r1, _0806530C @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _08065310 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _08065314 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08065318 @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
	b _08065388
	.align 2, 0
_08065304: .4byte 0x0203E02C
_08065308: .4byte 0x082E1218
_0806530C: .4byte 0x02019784
_08065310: .4byte 0x001F001F
_08065314: .4byte 0x02024460
_08065318: .4byte 0x0201FB00
_0806531C:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldr r1, _08065390 @ =0x010D0000
	cmp r0, r1
	bne _08065342
	ldr r0, [r4, #0x64]
	movs r1, #0x3c
	movs r2, #9
	bl NewEkrDragonBarkQuake
	ldr r0, _08065394 @ =0x000002F1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08065342:
	ldr r0, _08065398 @ =0x00000195
	ldrh r1, [r4, #0x2c]
	cmp r1, r0
	bne _08065388
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r0, _0806539C @ =0x082E1218
	ldr r1, _080653A0 @ =0x02019784
	bl LZ77UnCompWram
	ldr r0, _080653A4 @ =0x001F001F
	bl EfxTmFill
	ldr r0, _080653A8 @ =0x02024460
	movs r1, #0x1f
	bl TmFill
	bl EkrDragonTmCpyWithDistance
	ldr r0, _080653AC @ =0x0201FB00
	ldr r0, [r0]
	movs r1, #0
	bl EkrDragonTmCpyExt
	adds r0, r4, #0
	bl Proc_Break
_08065388:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065390: .4byte 0x010D0000
_08065394: .4byte 0x000002F1
_08065398: .4byte 0x00000195
_0806539C: .4byte 0x082E1218
_080653A0: .4byte 0x02019784
_080653A4: .4byte 0x001F001F
_080653A8: .4byte 0x02024460
_080653AC: .4byte 0x0201FB00
