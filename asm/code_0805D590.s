	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxReblowOBJ
StartSubSpell_efxReblowOBJ: @ 0x0805D590
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0805D5C0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D5C4 @ =0x08BA3160
	movs r1, #3
	bl Proc_Start
	adds r1, r0, #0
	str r5, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x29
	strb r4, [r0]
	cmp r4, #0
	bne _0805D5C8
	movs r0, #0x2b
	strh r0, [r1, #0x2e]
	movs r0, #0x44
	b _0805D5CE
	.align 2, 0
_0805D5C0: .4byte 0x0201774C
_0805D5C4: .4byte 0x08BA3160
_0805D5C8:
	movs r0, #0x1f
	strh r0, [r1, #0x2e]
	movs r0, #0x3d
_0805D5CE:
	strh r0, [r1, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
