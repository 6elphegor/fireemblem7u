	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809120C
sub_0809120C: @ 0x0809120C
	push {r4, r5, lr}
	bl ClearSupplyItems
	movs r4, #0
	ldr r0, _08091248 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	bhs _08091240
	ldr r5, _0809124C @ =0x020117E4
_0809121E:
	lsls r0, r4, #2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	bne _08091232
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _08091232
	bl AddItemToConvoy
_08091232:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08091248 @ =0x02012464
	ldrh r0, [r0]
	cmp r4, r0
	blo _0809121E
_08091240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091248: .4byte 0x02012464
_0809124C: .4byte 0x020117E4
