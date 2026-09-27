	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B750
sub_0806B750: @ 0x0806B750
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	bne _0806B762
	adds r0, r4, #0
	bl Proc_Break
	b _0806B786
_0806B762:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0806B786
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x60]
	bl AnimDelete
	bl SpellFx_ClearBG1
	adds r0, r4, #0
	bl Proc_Break
_0806B786:
	pop {r4}
	pop {r0}
	bx r0
