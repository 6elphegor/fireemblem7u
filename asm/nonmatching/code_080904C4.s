	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateMenuScrollBarConfig
UpdateMenuScrollBarConfig: @ 0x080904C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	ldr r0, _080904F4 @ =0x08CC4334
	bl Proc_Find
	cmp r0, #0
	beq _080904EE
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	strh r6, [r0, #0x2e]
	strh r4, [r0, #0x32]
	adds r0, #0x34
	strb r5, [r0]
_080904EE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080904F4: .4byte 0x08CC4334
