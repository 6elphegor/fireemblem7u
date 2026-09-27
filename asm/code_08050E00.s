	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBaStart_8056024
ekrBaStart_8056024: @ 0x08050E00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08050E14 @ =0x0203E00E
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050E1C
	ldr r1, _08050E18 @ =0x0201FACC
	movs r0, #6
	b _08050E20
	.align 2, 0
_08050E14: .4byte 0x0203E00E
_08050E18: .4byte 0x0201FACC
_08050E1C:
	ldr r1, _08050E48 @ =0x0201FACC
	movs r0, #0xa
_08050E20:
	str r0, [r1]
	ldr r0, _08050E4C @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	bl PutBanimBG
	ldr r0, _08050E50 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl EfxPalBlackInOut
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050E48: .4byte 0x0201FACC
_08050E4C: .4byte 0x0203E00A
_08050E50: .4byte 0x02022860
