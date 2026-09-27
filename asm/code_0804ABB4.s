	.include "macro.inc"

	.syntax unified

	thumb_func_start GetForceDisabledMenuItems
GetForceDisabledMenuItems: @ 0x0804ABB4
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	ldr r2, _0804ABD4 @ =0x03001458
	ldr r5, _0804ABD8 @ =MenuAlwaysNotShown
	adds r3, r2, #4
_0804ABC0:
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _0804ABDC
	ldr r0, [r3]
	cmp r0, r5
	bne _0804ABDC
	ldrh r0, [r2]
	b _0804ABDE
	.align 2, 0
_0804ABD4: .4byte 0x03001458
_0804ABD8: .4byte MenuAlwaysNotShown
_0804ABDC:
	movs r0, #0
_0804ABDE:
	strb r0, [r1]
	adds r1, #1
	adds r2, #8
	adds r3, #8
	adds r4, #1
	cmp r4, #0xf
	ble _0804ABC0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
