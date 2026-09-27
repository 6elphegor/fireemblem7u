	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxGespenstBGCOL2
StartSubSpell_efxGespenstBGCOL2: @ 0x08060BD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060C04 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060C08 @ =0x08BA3C84
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _08060C0C @ =0x081E93B6
	str r1, [r0, #0x48]
	ldr r1, _08060C10 @ =0x0829C01C
	str r1, [r0, #0x4c]
	ldr r0, _08060C14 @ =0x0829B13C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C04: .4byte 0x0201774C
_08060C08: .4byte 0x08BA3C84
_08060C0C: .4byte 0x081E93B6
_08060C10: .4byte 0x0829C01C
_08060C14: .4byte 0x0829B13C
