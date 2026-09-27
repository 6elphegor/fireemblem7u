	.include "macro.inc"

	.syntax unified

	thumb_func_start IsUnitInCurrentRoster
IsUnitInCurrentRoster: @ 0x0808DEF0
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0808DF14 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808DF1C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0808DF18
	movs r0, #1
	b _0808DF1E
	.align 2, 0
_0808DF14: .4byte 0x00010004
_0808DF18:
	movs r0, #8
	str r0, [r2, #0xc]
_0808DF1C:
	movs r0, #0
_0808DF1E:
	bx lr
