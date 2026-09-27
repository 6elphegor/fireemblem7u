	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxLvupBG2
NewEfxLvupBG2: @ 0x08069ED0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069F08 @ =0x08BDB7C4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08069F0C @ =0x082E5C2E
	str r1, [r0, #0x48]
	ldr r1, _08069F10 @ =0x08BDB7DC
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08069F14 @ =0x081E4F9C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _08069F18 @ =0x081E565C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069F08: .4byte 0x08BDB7C4
_08069F0C: .4byte 0x082E5C2E
_08069F10: .4byte 0x08BDB7DC
_08069F14: .4byte 0x081E4F9C
_08069F18: .4byte 0x081E565C
