	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateSioMenuBurstGlow
UpdateSioMenuBurstGlow: @ 0x080488D4
	push {lr}
	adds r1, r0, #0
	ldr r2, _08048900 @ =0x081C8104
	ldr r0, _08048904 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080488FA
	ldr r0, _08048908 @ =0x02022860
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	adds r0, r0, r2
	strh r1, [r0]
	bl EnablePalSync
_080488FA:
	pop {r0}
	bx r0
	.align 2, 0
_08048900: .4byte 0x081C8104
_08048904: .4byte 0x0203DCE8
_08048908: .4byte 0x02022860
