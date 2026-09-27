	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxSpellCast
NewEfxSpellCast: @ 0x0804FB6C
	push {r4, r5, lr}
	bl CheckInEkrDragon
	adds r4, r0, #0
	cmp r4, #0
	bne _0804FBB8
	ldr r0, _0804FBA0 @ =0x08B9AF64
	movs r1, #4
	bl Proc_Start
	adds r5, r0, #0
	adds r0, #0x29
	strb r4, [r0]
	strh r4, [r5, #0x2c]
	movs r0, #4
	strh r0, [r5, #0x2e]
	ldr r0, _0804FBA4 @ =0x02017778
	ldr r0, [r0]
	cmp r0, #0
	bne _0804FBB0
	ldr r0, _0804FBA8 @ =0x02022920
	ldr r1, _0804FBAC @ =0x0201C784
	movs r2, #0x50
	bl CpuFastSet
	b _0804FBB4
	.align 2, 0
_0804FBA0: .4byte 0x08B9AF64
_0804FBA4: .4byte 0x02017778
_0804FBA8: .4byte 0x02022920
_0804FBAC: .4byte 0x0201C784
_0804FBB0:
	bl Proc_End
_0804FBB4:
	ldr r0, _0804FBC0 @ =0x02017778
	str r5, [r0]
_0804FBB8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FBC0: .4byte 0x02017778
