	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBaStart_ExecEkrBattle6C
ekrBaStart_ExecEkrBattle6C: @ 0x08050D7C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08050DBC
	ldr r0, _08050DAC @ =0x0203E00A
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08050DA0
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08050DB0
_08050DA0:
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_End
	b _08050DBC
	.align 2, 0
_08050DAC: .4byte 0x0203E00A
_08050DB0:
	strh r0, [r4, #0x2c]
	bl NewEkrBattle
	adds r0, r4, #0
	bl Proc_Break
_08050DBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
