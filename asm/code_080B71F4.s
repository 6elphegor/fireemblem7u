	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B71F4
sub_080B71F4: @ 0x080B71F4
	push {lr}
	adds r2, r0, #0
	ldr r3, _080B7218 @ =0x02022860
	lsls r1, r1, #4
	cmp r1, #0
	ble _080B720E
_080B7200:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _080B7200
_080B720E:
	bl EnablePalSync
	pop {r0}
	bx r0
	.align 2, 0
_080B7218: .4byte 0x02022860
