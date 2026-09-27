	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreen_Init
StatScreen_Init: @ 0x08081088
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, _08081154 @ =0x08404B76
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	mov r0, sp
	bl InitBgs
	movs r0, #0x80
	lsls r0, r0, #3
	bl SetBlankChr
	ldr r0, _08081158 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl ApplySystemGraphics
	bl ApplyUnitSpritePalettes
	ldr r1, _0808115C @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackgroundAlt
	ldr r0, _08081160 @ =0x083FCE8C
	ldr r1, _08081164 @ =0x06014800
	bl Decompress
	movs r0, #4
	bl ApplyIconPalettes
	movs r0, #6
	bl ApplyUiStatBarPal
	movs r0, #1
	movs r1, #0x13
	bl ApplyIconPalette
	ldr r0, _08081168 @ =0x083FC9FC
	ldr r4, _0808116C @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08081170 @ =0x02023460
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08081174 @ =0x083FCC90
	ldr r1, _08081178 @ =0x06008C00
	bl Decompress
	ldr r0, _0808117C @ =0x083FCE0C
	movs r1, #0xe0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08081180 @ =0x02022880
	movs r2, #0x88
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #1
	movs r1, #0x14
	bl ApplyIconPalette
	ldr r0, _08081184 @ =0x083FD62C
	ldr r1, _08081188 @ =0x06004E00
	bl Decompress
	ldr r0, _0808118C @ =0x083FCBEC
	ldr r1, _08081190 @ =0x06010C00
	bl Decompress
	ldr r0, _08081194 @ =0x081D60F0
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r1, _08081198 @ =0x0200310C
	movs r0, #0
	str r0, [r1, #0x10]
	adds r0, r5, #0
	bl StatScreenUnitSlide_End
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081154: .4byte 0x08404B76
_08081158: .4byte 0x02023C60
_0808115C: .4byte 0x0600B000
_08081160: .4byte 0x083FCE8C
_08081164: .4byte 0x06014800
_08081168: .4byte 0x083FC9FC
_0808116C: .4byte 0x02020140
_08081170: .4byte 0x02023460
_08081174: .4byte 0x083FCC90
_08081178: .4byte 0x06008C00
_0808117C: .4byte 0x083FCE0C
_08081180: .4byte 0x02022880
_08081184: .4byte 0x083FD62C
_08081188: .4byte 0x06004E00
_0808118C: .4byte 0x083FCBEC
_08081190: .4byte 0x06010C00
_08081194: .4byte 0x081D60F0
_08081198: .4byte 0x0200310C
